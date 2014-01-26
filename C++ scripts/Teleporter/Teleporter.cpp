/*
 <! Scripted by AlexeWarr !>
  <ScriptBox Engine>
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "ObjectAccessor.h"
#include "WorldSession.h"
#include "Teleporter.h"
#include <cstring>

class AlexeWarrTeleporter_Gossip : public CreatureScript
{
    public:

        AlexeWarrTeleporter_Gossip() : CreatureScript("AlexeWarrTeleporter_Gossip") {}

        bool OnGossipHello(Player* player, Creature* creature) OVERRIDE
        {
			WorldSession* m_session = player->GetSession();

            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_CITIES, 1);
            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_ARENAS, 2);
            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_INSTANCES1, 2);
            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_INSTANCES2, 2);
            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_INSTANCES3, 2);
            sAwt->AddMenu(player, AWTI_1, AWTL_DEF_INSTANCES4, 2);

			sAwt->PendingMenu(player, creature);
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) OVERRIDE
        {
            player->PlayerTalkClass->ClearMenus();
            switch(action)
			{
            case GOSSIP_ACTION_INFO_DEF+1:
				sWorld->SendGlobalText("Accessed menu 1", NULL);
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
				sWorld->SendGlobalText("Accessed menu 2 closed", NULL);
                break;
			}

            player->CLOSE_GOSSIP_MENU();
            return true;
        }
};

void AddSC_AlexeWarrTeleporter_Gossip()
{
    new AlexeWarrTeleporter_Gossip();
}