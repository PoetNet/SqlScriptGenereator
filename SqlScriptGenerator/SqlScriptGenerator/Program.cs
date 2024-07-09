using SqlScriptGenerator.WindowFunctionsService;

string sqlScript = WindowFunctionsGenerator.Generate(2000, 100, 4);

string filePath = Path.Combine("..", @"..", @"..", @"WindowFunctionsService", @"Scripts", @"2000-100-4-Update.sql");
File.WriteAllText(filePath, sqlScript);