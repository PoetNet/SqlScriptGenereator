using System.Text;

namespace SqlScriptGenerator.WindowFunctionsService;

public class WindowFunctionsGenerator
{
    public static string BaseFunctionGuidFormat = "1ee1c11a-1f11-1f01-1ad1-{0:000000000000}";
    //public static string BaseSplitterGuidFormat = "2ee2c22a-2f22-2f22-2ad2-{0:000000000000}";
    public static string BaseTagGuidFormat = "3ee3c33a-3f33-3f33-3ad3-{0:000000000000}";

    public static string FirstFunctionScript = """dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;""";
    public static string SecondFunctionScript = """dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); dataPoints = get_history("func1_alias"); a2 = avg(dataPoints); return a1 + a2;""";
    //public static string GeneralFunctionScript = """dataPoints = get_history("split1_alias"); a1 = avg(dataPoints); dataPoints = get_history("func1_alias"); a2 = avg(dataPoints); dataPoints = get_history("func2_alias"); a3 = avg(dataPoints); return a1 + a2 + a3;""";

    public static string ShiftScheduleId = "bb9a7e57-9ea2-4a39-9005-b532f6988777";

    public static string Generate(
        int numFunc,
        int numTag,
        int deep
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

        CreateWindowFunctions(sb, numTag, numFunc, deep);
        //CreateSplitters(sb, numTag);
        CreateTags(sb, numTag);
        CreateEdges(sb, numFunc, numTag, deep);

        return sb.ToString();
    }

    public static string CreateGuid(string baseFormat, int num) => string.Format(baseFormat, num);

    public static void CreateWindowFunctions(StringBuilder sb,int tagNum, int numFunc = 1, int deep = 4)
    {
        string sqlScriptTemplate = @$"
INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""Name"", ""Script"", ""WindowType"", ""IsEnabled"", ""Interval"", ""ShiftScheduleId"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        Random interval = new();

        int windowsType = 0;
        int tagNumber = 1;
        int deepCounter = 1;

        for (int i = 1; i <= numFunc; i++)
        {
            string nodeId = CreateGuid(BaseFunctionGuidFormat, i);

            StringBuilder scriptBuilder = new StringBuilder();

            if ((i - 1) % deep == 0 ||  i == 1)
            {
                if (deepCounter == deep)
                {
                    tagNumber++;
                    if (tagNumber > tagNum) tagNumber = 1;

                    scriptBuilder.Append($"""dataPoints = get_history("tag{tagNumber}_alias"); a1 = avg(dataPoints); return a1;""");
                    deepCounter = 1;
                }
                else
                {
                    scriptBuilder.Append($"""dataPoints = get_history("tag{tagNumber}_alias"); a1 = avg(dataPoints); return a1;""");
                }
            }
            else
            {
                scriptBuilder.Append($"""dataPoints = get_history("func{i - 1}_alias"); a1 = avg(dataPoints); return a1;""");
                deepCounter++;
            }

            var script = scriptBuilder.ToString();
            string shiftSchedule = windowsType < 5 ? $"'{ShiftScheduleId}'" : "null";
            sb.Append($"\n\t('{nodeId}', 'Функция {i}', 'function', 'Func{i}', '{script}', {windowsType++}, true, '{interval.Next(2, 10)} minutes', {shiftSchedule}),");
            
            if (windowsType > 12) windowsType = 0;
            if (tagNumber > tagNum) tagNumber = 1;
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }

    public static void CreateTags(StringBuilder sb, int numTag = 1)
    {
        string sqlScriptTemplate = @$"
INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""SourceId"", ""TagId"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        for (int i = 1; i <= numTag; i++)
        {
            string nodeId = CreateGuid(BaseTagGuidFormat, i);
            sb.Append($"\n\t('{nodeId}', 'Tэг {i}', 'tag', 'source{i}', 'tag{i}'),");
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }    
    
//    public static void CreateSplitters(StringBuilder sb, int numSplitters = 1)
//    {
//        string sqlScriptTemplate = @$"
//INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""Name"", ""WindowType"", ""ScheduleWindow"", ""IsEnabled"", ""Interval"", ""Period"", ""ShiftScheduleId"", ""Divisor"")
//    VALUES";
//        sb.Append(sqlScriptTemplate);

//        Random interval = new();

//        for (int i = 1; i <= numSplitters; i++)
//        {
//            string nodeId = CreateGuid(BaseSplitterGuidFormat, i);
//            sb.Append($"\n\t('{nodeId}', 'Сплиттер {i}', 'splitter', 'Split{i}', 6, 0, true, '{interval.Next(2, 10)} minutes', null, '{ShiftScheduleId}', 1.0),");
//        }

//        sb.Remove(sb.Length - 1, 1);
//        sb.Append(";\n");
    //}

    public static void CreateEdges(
        StringBuilder sb, 
        int numFunc, 
        int tagNum, 
        int deep
        )
    {
        string sqlScriptTemplate = @$"
INSERT INTO ""Edges"" (""SourceNodeId"", ""DestinationNodeId"", ""SourceNodeAlias"")
    VALUES";
        sb.Append(sqlScriptTemplate);

        //for (int i = 1; i <= numTag; i++)
        //{
        //    string sourceId = CreateGuid(BaseTagGuidFormat, i);
        //    string destinationId = CreateGuid(BaseSplitterGuidFormat, i);
        //    sb.Append($"\n\t('{sourceId}', '{destinationId}', 'tag{i}_alias'),");
        //}
        //sb.Append("\n\n");

        int deepCounter = 1;
        int tagNumber = 1;
        string sourceId;
        string alias;
        for (int i = 1; i <= numFunc; i++)
        {
            if ((i - 1) % deep == 0 ||  i == 1)
            {
                if (deepCounter == deep)
                {
                    tagNumber++;
                    if (tagNumber > tagNum) tagNumber = 1;

                    sourceId = CreateGuid(BaseTagGuidFormat, tagNumber);
                    alias = $"tag{tagNumber}_alias";
                    deepCounter = 1;
                }
                else
                {
                    sourceId = CreateGuid(BaseTagGuidFormat, tagNumber);
                    alias = $"tag{tagNumber}_alias";
                }
            }
            else
            {
                sourceId = CreateGuid(BaseFunctionGuidFormat, i - 1);
                alias = $"func{i - 1}_alias";

                deepCounter++;
            }

            string destinationId = CreateGuid(BaseFunctionGuidFormat, i);
            sb.Append($"\n\t('{sourceId}', '{destinationId}', '{alias}'),");

            if (tagNumber > tagNum) tagNumber = 1;


        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n\n");
    }
}
