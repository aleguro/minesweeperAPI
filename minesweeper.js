export default class MinesWeeper {

    constructor(endPoint) {

        this.endPoint = endPoint;
        this.user = new User();
    }
}

class User {

    create() {

        this.userId = null;
        this.games  = [];
        //TODO : Implement POST Ajax call to endpoint/users/ ->set(this.userId)
        //TODO : class this.get()
    }

    get() {

        //TODO : Implement GET Ajax call to `endpoint/users/${this.userId}/games`
        // Fetches games into this.games and create batch of Game classes instances
    }
}

class Game {

    constructor(endPoint, user, gameId) {

        this.endPoint = endPoint;
        this.user     = user;
        this.gameId   = gameId;
    }

    get() {

        //TODO: Implement GET Ajax call to `endpoint/games/${this.gameId}`
        // crete batch of cells classes with the grid cells comming from the request response.
    }

    play() {

        // TODO: Implement PUT Ajax call to `endpoint/games/${this.gameId}`
    }

    pause() {

        // TODO: Implement PUT Ajax call to `endpoint/games/${this.gameId}`
    }

    finish() {

        // TODO: Implement PUT Ajax call to `endpoint/games/${this.gameId}`
    }

    reload() {

        // TODO: Call to get()
    }

    over(status) {

        // TODO: Implement PUT Ajax call to `endpoint/games/${this.gameId}`
    }
}

class Cells {

    constructor(endPoint, game, cellId) {

        this.endPoint = endPoint;
        this.cellId   = cellId;
        this.game     = game;
    }

    flag() {

        // TODO: Implement PUT Ajax call to `endpoint/cells/${this.cellId}`
    }

    click() {

        // TODO: Implement PUT Ajax call to `endpoint/cells/${this.cellId}`
        // TODO: call to this.game.reload();
        // TODO: depending on result call this.game.over(result);
    }
}