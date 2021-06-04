global.Game = {

	TurnNumber: 1,
	
    Setup: function() {
        //CurrentId = 1;
        //NotificationLog = new List<LogEntry>();
        TurnNumber = 0;

        global.Player.SettlementData = new SettlementDataClass();
		
        //Enemy.Monsters = new List<BoardPiece>();

        //Grid.BuildNew();

        //TilePallet = new TilePallet();
        //TilePallet.Fill();

        //////////Enemy.SpawnMonster();


        //////////var solider = new BoardPiece(BoardPieceType.Soldier, Grid.GetHex(5, 2), 20);

        //////////Player.SettlementData.Soliders.Add(solider);
    },

	
	ProcessTurn: function() {
	
		show_debug_message("Processing turn");
	
        TurnNumber++;

        //TurnActions = new List<TurnAction>();

        //Enemy.TakeActions();

        global.Player.TakeActions();
	}

};