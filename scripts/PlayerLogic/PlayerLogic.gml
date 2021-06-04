global.Player = {
	
	SettlementData: pointer_null,
	
	TakeActions: function() {
		
		show_debug_message("Taking actions...");
		
        //SettlementData.Upkeep();

        //SettlementData.TryBuildFarm();

        SettlementData.TryBuildHouse();

        //SettlementData.TakeSoldierActions();
    }	
	
};

