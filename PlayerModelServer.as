string plugin_path = "scripts/plugins/PlayerModelServer/";
dictionary models;

void print(string text) { g_Game.AlertMessage( at_console, text); }
void println(string text) { print(text + "\n"); }

dictionary LoadModelList(string fpath) {
	dictionary maps;
	File@ f = g_FileSystem.OpenFile( fpath, OpenFile::READ );
	if (f is null or !f.IsOpen()) {
		println("PlayerModelServer: Failed to open " + fpath);
		return maps;
	}
	
	int modelCount = 0;
	string line;
	while( !f.EOFReached() ) {
		f.ReadLine(line);
		line.Trim();
		line.Trim("\t");
		if (line.Length() == 0 or line.Find("//") == 0)
			continue;
		maps[line] = true;
		modelCount++;
	}
	return maps;
}

void PluginInit() {
	g_Module.ScriptInfo.SetAuthor( "naelstrof" );
	g_Module.ScriptInfo.SetContactInfo( "naelstrof@gmail.com" );
}

void MapInit() {
	models = LoadModelList(plugin_path + "playermodels.txt");
	array<string> modelList = models.getKeys();
	for(uint i=0;i<modelList.length();i++) {
		string filepath = modelList[i];
		if (filepath.EndsWith(".bmp")) {
			g_Game.PrecacheGeneric(filepath);
			println("PlayerModelServer: Precaching bmp" + filepath);
		}
		if (filepath.EndsWith(".mdl")) {
			g_Game.PrecacheModel(filepath);
			println("PlayerModelServer: Precaching model " + filepath);
		}
	}
}
