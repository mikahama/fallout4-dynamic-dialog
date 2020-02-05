ScriptName Creativity Extends Actor

Actor Property PlayerRef Auto

Struct UserLog
	string Caller
	string FileName
EndStruct

string Function str(int s) Global
	return s as string
EndFunction

string Function GetInfo() Global
	Actor player = Game.GetPlayer()
	string s = "{"
	s = s + "'health':" + "'" + str(player.GetValue(Game.GetHealthAV()) as int) + "',"
	s = s + "'agility':" + "'" + str(player.GetValue(Game.GetAgilityAV()) as int) + "',"
	s = s + "'charisma':" + "'" + str(player.GetValue(Game.GetCharismaAV()) as int) + "',"
	s = s + "'endurance':" + "'" + str(player.GetValue(Game.GetEnduranceAV()) as int) + "',"
	s = s + "'intelligence':" + "'" + str(player.GetValue(Game.GetIntelligenceAV()) as int) + "',"
	s = s + "'Luck':" + "'" + str(player.GetValue(Game.GetLuckAV()) as int) + "',"
	s = s + "'Perception':" + "'" + str(player.GetValue(Game.GetPerceptionAV()) as int) + "',"
	s = s + "'Strength':" + "'" + str(player.GetValue(Game.GetStrengthAV()) as int) + "',"
	s = s + GetGameStats()
	return s + "}"
EndFunction

bool Function WriteLine(UserLog Log, var Text) Global
	If (Log == none)
		Log = new UserLog
		Log.Caller = ""
		Log.FileName = "User"
	ElseIf (StringIsNoneOrEmpty(Log.FileName))
		Log.FileName = "User"
	EndIf
	Text = Log.Caller + " " + Text
	If(Debug.TraceUser(Log.FileName, Text))
		return true
	Else
		Debug.OpenUserLog(Log.FileName)
		return Debug.TraceUser(Log.FileName, Text)
	EndIf
EndFunction

bool Function StringIsNoneOrEmpty(string value) Global
	return !(value) || value == ""
EndFunction

UserLog Log
 
 
Event OnInit()
	Log = new UserLog
	Log.Caller = self
	Log.FileName = "CreativityLog"
EndEvent

Event OnPlayerDialogueTarget()
	; triggered when dialog starts
	WriteLine(Log, "... START ...")
	WriteLine(Log, GetInfo())
	WriteLine(Log, "... END ...")
EndEvent

string Function GetGameStats() Global
	string[] myArray = new string[104]
	myArray[0] = "Locations Discovered"
	myArray[1] = "Dungeons Cleared"
	myArray[2] = "Days Passed"
	myArray[3] = "Hours Slept"
	myArray[4] = "Hours Waiting"
	myArray[5] = "Standing Stones Found"
	myArray[6] = "Gold Found"
	myArray[7] = "Most Gold Carried"
	myArray[8] = "Chests Looted"
	myArray[9] = "Skill Increases"
	myArray[10] = "Skill Books Read"
	myArray[11] = "Food Eaten"
	myArray[12] = "Training Sessions"
	myArray[13] = "Books Read"
	myArray[14] = "Horses Owned"
	myArray[15] = "Houses Owned"
	myArray[16] = "Stores Invested In"
	myArray[17] = "Barters"
	myArray[18] = "Persuasions"
	myArray[19] = "Bribes"
	myArray[20] = "Intimidations"
	myArray[21] = "Diseases Contracted"
	myArray[22] = "Days as a Vampire"
	myArray[23] = "Days as a Werewolf"
	myArray[24] = "Necks Bitten"
	myArray[25] = "Vampirism Cures"
	myArray[26] = "Werewolf Transformations"
	myArray[27] = "Mauls"
	myArray[28] = "Quests Completed"
	myArray[29] = "Misc Objectives Completed"
	myArray[30] = "Main Quests Completed"
	myArray[31] = "Side Quests Completed"
	myArray[32] = "The Companions Quests Completed"
	myArray[33] = "College of Winterhold Quests Completed"
	myArray[34] = "Thieves' Guild Quests Completed"
	myArray[35] = "The Dark Brotherhood Quests Completed"
	myArray[36] = "Civil War Quests Completed"
	myArray[37] = "Daedric Quests Completed"
	myArray[38] = "Dawnguard Quests Completed"
	myArray[39] = "Dragonborn Quests Completed"
	myArray[40] = "Questlines Completed"
	myArray[41] = "People Killed"
	myArray[42] = "Animals Killed"
	myArray[43] = "Creatures Killed"
	myArray[44] = "Undead Killed"
	myArray[45] = "Daedra Killed"
	myArray[46] = "Automatons Killed"
	myArray[47] = "Favorite Weapon"
	myArray[48] = "Critical Strikes"
	myArray[49] = "Sneak Attacks"
	myArray[50] = "Backstabs"
	myArray[51] = "Weapons Disarmed"
	myArray[52] = "Brawls Won"
	myArray[53] = "Bunnies Slaughtered"
	myArray[54] = "Spells Learned"
	myArray[55] = "Favorite Spell"
	myArray[56] = "Favorite School"
	myArray[57] = "Dragon Souls Collected"
	myArray[58] = "Words Of Power Learned"
	myArray[59] = "Words Of Power Unlocked"
	myArray[60] = "Shouts Learned"
	myArray[61] = "Shouts Unlocked"
	myArray[62] = "Shouts Mastered"
	myArray[63] = "Times Shouted"
	myArray[64] = "Favorite Shout"
	myArray[65] = "Soul Gems Used"
	myArray[66] = "Souls Trapped"
	myArray[67] = "Magic Items Made"
	myArray[68] = "Weapons Improved"
	myArray[69] = "Weapons Made"
	myArray[70] = "Armor Improved"
	myArray[71] = "Armor Made"
	myArray[72] = "Potions Mixed"
	myArray[73] = "Potions Used"
	myArray[74] = "Poisons Mixed"
	myArray[75] = "Poisons Used"
	myArray[76] = "Ingredients Harvested"
	myArray[77] = "Ingredients Eaten"
	myArray[78] = "Nirnroots Found"
	myArray[79] = "Wings Plucked"
	myArray[80] = "Total Lifetime Bounty"
	myArray[81] = "Largest Bounty"
	myArray[82] = "Locks Picked"
	myArray[83] = "Pockets Picked"
	myArray[84] = "Items Pickpocketed"
	myArray[85] = "Times Jailed"
	myArray[86] = "Days Jailed"
	myArray[87] = "Fines Paid"
	myArray[88] = "Jail Escapes"
	myArray[89] = "Items Stolen"
	myArray[90] = "Assaults"
	myArray[91] = "Murders"
	myArray[92] = "Horses Stolen"
	myArray[93] = "Trespasses"
	myArray[94] = "Eastmarch Bounty"
	myArray[95] = "Falkreath Bounty"
	myArray[96] = "Haafingar Bounty"
	myArray[97] = "Hjaalmarch Bounty"
	myArray[98] = "The Pale Bounty"
	myArray[99] = "The Reach Bounty"
	myArray[100] = "The Rift Bounty"
	myArray[101] = "Tribal Orcs Bounty"
	myArray[102] = "Whiterun Bounty"
	myArray[103] = "Winterhold Bounty"
	string s = ""
	int currentItem = 0
	while (currentItem < 104)
		 s= s + "'" + myArray[currentItem] + "':'" + str(Game.QueryStat(myArray[currentItem])) + "',"
		currentItem += 1
	endWhile
	return s
EndFunction