import ApplicationController from './application_controller';

export default class extends ApplicationController {
    reload_players(event) {
        this.stimulate("GameReflex#set_players", {
            game_uuid: this.data.get("uuid"),
            player_uuid: this.data.get('player-uuid')
        });
    }
}
