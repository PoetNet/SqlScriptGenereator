using SqlScriptGenerator.WindowFunctionsService;

string sqlScript = WindowFunctionsGenerator.Generate(60000, 600, 4);

string filePath = Path.Combine("..", "..", "..", "WindowFunctionsService", "Scripts", "30000-300-4.sql");
File.WriteAllText(filePath, sqlScript);
