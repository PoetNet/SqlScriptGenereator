using System.Text;

namespace SqlScriptGenerator.WindowFunctionsService;

public class WindowFunctionsGenerator
{
    public static string BaseFunctionGuidFormat = "1ee1c11a-1f11-1f01-1ad1-{0:000000000000}";
    public static string BaseSplitterGuidFormat = "2ee2c22a-2f22-2f22-2ad2-{0:000000000000}";
    public static string BaseTagGuidFormat = "3ee3c33a-3f33-3f33-3ad3-{0:000000000000}";
    public static string BaseFunctionScript = """'dataPoints = get_history("func1_alias"); a1 = avg(dataPoints); dataPoints = get_history("func2_alias"); a2 = avg(dataPoints); dataPoints = get_history("func3_alias"); a3 = avg(dataPoints); return a1 + a2 + a3;''dataPoints = get_history("func1_alias"); a1 = avg(dataPoints); dataPoints = get_history("func2_alias"); a2 = avg(dataPoints); dataPoints = get_history("func3_alias"); a3 = avg(dataPoints); return a1 + a2 + a3;'""";
    public static string ShiftScheduleId = "bb9a7e57-9ea2-4a39-9005-b532f6988777";

    public string Generate(int numFunc)
    {
        string scriptTemplate = @$"
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
        sb.Append(scriptTemplate);

        CreateWindowFunctions(sb, numFunc);
        CreateSplitters(sb);
        CreateTags(sb);

        return sb.ToString();

        // Optionally, write the script to a file
    }

    public static string CreateGuid(string baseFormat, int num) => string.Format(baseFormat, num);

    public static void CreateWindowFunctions(StringBuilder sb, int numFunc = 1)
    {
        string scriptTemplate = @$"
            INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""Name"", ""Script"", ""WindowType"", ""IsEnabled"", ""Interval"", ""ShiftScheduleId"")
                VALUES";
        sb.Append(scriptTemplate);

        Random interval = new();

        int windowsType = 0;
        for (int i = 1; i <= numFunc; i++)
        {
            string nodeId = CreateGuid(BaseFunctionGuidFormat, i);

            string shiftschedule = windowsType < 5 ? ShiftScheduleId : "null";
            sb.Append($"\n\t('{nodeId}', 'Функция {i}', 'function', 'Func{i}', '{BaseFunctionScript}', {windowsType++}, true, '{interval.Next(2, 10)} minutes', '{shiftschedule}'),");
            
            if (windowsType > 12) windowsType = 0;
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }

    public static void CreateTags(StringBuilder sb, int numTag = 1)
    {
        string scriptTemplate = @$"
            INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""SourceId"", ""TagId"")
                VALUES";
        sb.Append(scriptTemplate);

        for (int i = 1; i <= numTag; i++)
        {
            string nodeId = CreateGuid(BaseTagGuidFormat, i);
            sb.Append($"\n\t('{nodeId}', 'Tэг {i}', 'tag', 'source{i}', 'tag{i}'),");
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }    
    
    public static void CreateSplitters(StringBuilder sb, int numSplitters = 1)
    {
        string scriptTemplate = @$"
            INSERT INTO ""Nodes"" (""Id"", ""DisplayName"", ""NodeType"", ""Name"", ""WindowType"", ""ScheduleWindow"", ""IsEnabled"", ""Interval"", ""Period"", ""ShiftScheduleId"", ""Divisor"")
                VALUES";
        sb.Append(scriptTemplate);

        Random interval = new();

        for (int i = 1; i <= numSplitters; i++)
        {
            string nodeId = CreateGuid(BaseTagGuidFormat, i);
            sb.Append($"\n\t('{nodeId}', 'Сплиттер {i}', 'splitter', 'Split{i}', 6, 0, true, {interval.Next(2, 10)}, null, {ShiftScheduleId}, 1.0),");
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(";\n");
    }

    public void WriteToFile(string filePath, string script)
    {
        File.WriteAllText(filePath, script);
    }
}