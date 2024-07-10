using SqlScriptGenerator.WindowFunctionsService;

string sqlScript = WindowFunctionsGenerator.Generate(3000, 300, 8, 1500);

string filePath = Path.Combine("..", @"..", @"..", @"WindowFunctionsService", @"Scripts", @"3000-300-8-1500-Update.sql");
File.WriteAllText(filePath, sqlScript);