#ifndef DEF_ALEXEWARRTELEPORTER_H
#define DEF_ALEXEWARRTELEPORTER_H

#include "ScriptPCH.h"
#include "Config.h"

enum Npc_Text
{
    TEXT_ALLIANCE = 100000,
    TEXT_HORDE = 100001
};

class AlexeWarrTeleporter
{
public:

	std::string Gls(WorldSession* session, uint32 entry) { return session->GetTrinityString(entry); }

    void AddMenu(Player* player, uint32 icon, uint32 string, uint32 action) 
	{ 
		WorldSession* m_session = player->GetSession();

		player->ADD_GOSSIP_ITEM(icon, Gls(m_session, string), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + action); 
	}

    void PendingMenu(Player* player, Creature* creature)
	{
		player->PlayerTalkClass->SendGossipMenu(player->GetTeamId() == TEAM_ALLIANCE ? TEXT_ALLIANCE : TEXT_HORDE, creature->GetGUID());
	}
};

enum Language_Default
{
	AWTL_DEF_CITIES			= 51100, // world cities
	AWTL_DEF_ARENAS			= 51101, // world battle rings
	AWTL_DEF_INSTANCES1		= 51102, // level 1-60 instances
	AWTL_DEF_INSTANCES2		= 51103, // level 60+ instnaces
	AWTL_DEF_INSTANCES3		= 51104, // level 70+ instances
	AWTL_DEF_INSTANCES4		= 51105, // wotlk instances
	AWTL_DEF_MAX
};

enum AlexeWarrGossipIcon
{
    AWTI_1            = 0,                    // white chat bubble
    AWTI_2            = 1,                    // brown bag
    AWTI_3            = 2,                    // flightmarker (paperplane)
    AWTI_4            = 3,                    // brown book (trainer)
    AWTI_5            = 4,                    // golden interaction wheel
    AWTI_6            = 5,                    // golden interaction wheel
    AWTI_7            = 6,                    // brown bag (with gold coin in lower corner)
    AWTI_8            = 7,                    // white chat bubble (with "..." inside)
    AWTI_9            = 8,                    // white tabard
    AWTI_10           = 9,                    // two crossed swords
    AWTI_11           = 10,                   // yellow dot/point
    AWTI_MAX
};

#define sAwt ACE_Singleton<AlexeWarrTeleporter, ACE_Null_Mutex>::instance()
#endif