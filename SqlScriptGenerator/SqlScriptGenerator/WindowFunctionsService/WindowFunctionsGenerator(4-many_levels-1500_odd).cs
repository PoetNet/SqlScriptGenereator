using System.Text;

namespace SqlScriptGenerator.WindowFunctionsService;

public class WindowFunctionsGenerator
{
    public static string BaseFunctionGuidFormat = "1ee1c11a-1f11-1f01-1ad1-{0:000000000000}";
    public static string BaseTagGuidFormat = "3ee3c33a-3f33-3f33-3ad3-{0:000000000000}";

    public static string ShiftScheduleId = "bb9a7e57-9ea2-4a39-9005-b532f6988777";

    public static string Generate(
        int numFunc,
        int numTag,
        int deep,
        int numOdd
        )
    {
        string sqlScriptTemplate = @$"
TRUNCATE TABLE ""Edges"", ""Nodes"", ""ShiftSchedules"", ""Shifts"" CASCADE;

INSERT INTO ""ShiftSchedules"" (""Id"", ""TimeZone"", ""StartsFromFirstDayOfMonth"")
VALUES
  ('{ShiftScheduleId}', 3, true);

INSERT INTO ""Shifts"" (""Id"", ""Start"", ""End"", ""Number"", ""ShiftScheduleId"")
VALUES
    ('bb9a7e57-9ea2-4a39-9005-b532f6988cca', '19:00:00', '07:00:00', 1, '{ShiftScheduleId}'),
    ('bb9a7e57-9ea2-4a39-9005-b532f6988ccb', '07:00:00', '19:00:00', 2, '{ShiftScheduleId}'); 
";

        StringBuilder sb = new();
        sb.Append(sqlScriptTemplate);

        CreateWindowFunctions(sb, numTag, numFunc, deep, numOdd);
        CreateTags(sb, numTag);
        CreateEdges(sb, numFunc, numTag, deep, numOdd);

        return sb.ToString();
    }

    public static string CreateGuid(string baseFormat, int num) => string.Format(baseFormat, num);

    public static void CreateWindowFunctions(StringBuilder sb, int tagNum, int numFunc = 1, int deep = 4, int numOdd = 9)
    {
        string sqlScriptTemplate = @$"
INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""Name"", ""Script"", ""WindowType"", ""IsEnabled"", ""Interval"", ""ShiftScheduleId"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        //if (numFunc > Constants.MaxOddFunctions)
        //{

        //}
        //else
        //{
        int tagNumber = 1;
        Dictionary<int, int> tagsDescCount = new();

        for (int i = 1; i <= numOdd * 2; i += 2)
        {
            string nodeId = CreateGuid(BaseFunctionGuidFormat, i);
            StringBuilder scriptBuilder = new StringBuilder();

            if (tagsDescCount.TryGetValue(tagNumber, out int _))
            {
                tagsDescCount[tagNumber]++;
            }
            else
            {
                tagsDescCount.Add(tagNumber, 1);
            }

            scriptBuilder.Append($"""return history_avg("tag{tagNumber++}_alias");""");

            var script = scriptBuilder.ToString();
            sb.Append($"\n\t('{nodeId}', 'Функция {i}', 'function', 'Func{i}', '{script}', 5, true, '20 seconds', '{ShiftScheduleId}'),");

            if (tagNumber > tagNum) tagNumber = 1;
        }

        int oddFunctionCounter = 0;
        int tagsCounter = 1;
        int tagDescCounter = 0;
        int oddFunctionNumber = 1;

        int funcFix = 1;

        int lastAtSecondLevel = 0;

        for (int i = 2; i <= numOdd * 2; i += 2)
        {
            string nodeId = CreateGuid(BaseFunctionGuidFormat, i);
            StringBuilder scriptBuilder = new StringBuilder();

            scriptBuilder.Append($"""return history_avg("func{oddFunctionNumber}_alias");""");
            oddFunctionNumber += tagNum * 2;

            tagDescCounter++;
            oddFunctionCounter++;

            if (tagDescCounter == tagsDescCount[tagsCounter])
            {
                funcFix += 2;
                oddFunctionNumber = funcFix;
                tagsCounter++;
                tagDescCounter = 0;
            }
            if (tagsCounter > tagNum)
            {
                tagsCounter = 1;
            }


            var script = scriptBuilder.ToString();
            sb.Append($"\n\t('{nodeId}', 'Функция {i}', 'function', 'Func{i}', '{script}', 6, true, '60 seconds', '{ShiftScheduleId}'),");

            lastAtSecondLevel = i;

            if (oddFunctionCounter > numOdd)
            {
                break;
            }
        }


        if (deep > 2)
        {
            int funcsPerLevel = numOdd;
            int funcsPerLevelCounter = 0;

            int windowsType = 7;
            var deepCounter = 2;

            Random interval = new();

            for (int i = lastAtSecondLevel + 1; i <= numFunc; i++)
            {
                string nodeId = CreateGuid(BaseFunctionGuidFormat, i);

                StringBuilder scriptBuilder = new StringBuilder();

                scriptBuilder.Append($"""return history_avg("func{i - funcsPerLevel}_alias");""");
                funcsPerLevelCounter++;

                var script = scriptBuilder.ToString();
                sb.Append($"\n\t('{nodeId}', 'Функция {i}', 'function', 'Func{i}', '{script}', {windowsType}, true, '{interval.Next(20, 60)} seconds', '{ShiftScheduleId}'),");

                if (funcsPerLevelCounter == funcsPerLevel)
                {
                    windowsType++;
                    funcsPerLevelCounter = 0;
                    deepCounter++;
                }
                if (windowsType > 12 ||  deepCounter == deep) break;
            }
        }
        //}
        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }

    public static void CreateTags(StringBuilder sb, int numTag = 1)
    {
        var sourceTagsLength = Constants.SourceTags.Count();
        var tagList = numTag == sourceTagsLength ? Constants.SourceTags : Constants.SourceTags.GetRange(0, numTag);

        string sqlScriptTemplate = @$"
INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""SourceId"", ""TagId"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        for (int i = 0; i < numTag; i++)
        {
            string nodeId = CreateGuid(BaseTagGuidFormat, i+1);
            sb.Append($"\n\t('{nodeId}', 'Tэг {i+1}', 'tag', '{tagList[i].SourceId}', '{tagList[i].TagId}'),");
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }


    public static void CreateEdges(
        StringBuilder sb,
        int numFunc,
        int tagNum,
        int deep,
        int numOdd = 9
        )
    {
        string sqlScriptTemplate = @$"
INSERT INTO ""Edges"" (""SourceNodeId"", ""DestinationNodeId"", ""SourceNodeAlias"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        int tagNumber = 1;

        string sourceId;
        string alias;

        Dictionary<int, int> tagsDescCount = new();

        for (int i = 1; i <= numOdd * 2; i += 2)
        {
            sourceId = CreateGuid(BaseTagGuidFormat, tagNumber);

            if (tagsDescCount.TryGetValue(tagNumber, out int _))
            {
                tagsDescCount[tagNumber]++;
            }
            else
            {
                tagsDescCount.Add(tagNumber, 1);
            }

            alias = $"tag{tagNumber++}_alias";
            string destinationId = CreateGuid(BaseFunctionGuidFormat, i);
            sb.Append($"\n\t('{sourceId}', '{destinationId}', '{alias}'),");

            if (tagNumber > tagNum)
            {
                tagNumber = 1;
            }
        }

        int oddFunctionCounter = 0;
        int tagsCounter = 1;
        int tagDescCounter = 0;
        int oddFunctionNumber = 1;

        int funcFix = 1;

        int lastAtSecondLevel = 0;

        for (int i = 2; i <= numOdd * 2; i += 2)
        {
            sourceId = CreateGuid(BaseFunctionGuidFormat, oddFunctionNumber);
            alias = $"func{oddFunctionNumber}_alias";
            oddFunctionNumber += tagNum * 2;
            tagDescCounter++;
            oddFunctionCounter++;

            if (tagDescCounter == tagsDescCount[tagsCounter])
            {
                funcFix += 2;
                oddFunctionNumber = funcFix;
                tagsCounter++;
                tagDescCounter = 0;
            }
            if (tagsCounter > tagNum)
            {
                tagsCounter = 1;
            }

            string destinationId = CreateGuid(BaseFunctionGuidFormat, i);
            sb.Append($"\n\t('{sourceId}', '{destinationId}', '{alias}'),");

            lastAtSecondLevel = i;

            if (oddFunctionCounter > numOdd)
            {
                break;
            }
        }


        if (deep > 2)
        {
            int funcsPerLevel = numOdd;
            int funcsPerLevelCounter = 0;

            int windowsType = 7;
            var deepCounter = 2;

            for (int i = lastAtSecondLevel + 1; i <= numFunc; i++)
            {
                sourceId = CreateGuid(BaseFunctionGuidFormat, i - funcsPerLevel);

                alias = $"func{i - funcsPerLevel}_alias";
                funcsPerLevelCounter++;

                string destinationId = CreateGuid(BaseFunctionGuidFormat, i);

                sb.Append($"\n\t('{sourceId}', '{destinationId}', '{alias}'),");

                if (funcsPerLevelCounter == funcsPerLevel)
                {
                    windowsType++;
                    funcsPerLevelCounter = 0;
                    deepCounter++;
                }
                if (windowsType > 12 ||  deepCounter == deep) break;
            }
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n\n");
    }
}
