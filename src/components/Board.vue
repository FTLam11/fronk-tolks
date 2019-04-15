<template>
  <div>
    <button @click="resetBoard" type="reset">Reset</button>
    <p>{{ message }}</p>
    <div class="game-board">
      <div
        v-for="(tile, idx) in board"
        :key="idx"
        class="box"
        :class="{ selected: idx === activeTileIdx }"
        @click="selectMove(idx)"
      >
        {{ tile }}
      </div>
    </div>
  </div>
</template>

<script>
import winConditions from "../util/winConditions";

const BoardFactory = tileCount => {
  let board = [];

  for (let i = 0; i < tileCount; i++) {
    board.push("");
  }

  return board;
};

export default {
  name: "Board",
  data: function() {
    return {
      board: BoardFactory(9),
      activeTileIdx: null,
      message: ""
    };
  },
  methods: {
    selectMove(tile_idx) {
      this.activeTileIdx = tile_idx;
    },
    resetBoard() {
      this.board = BoardFactory(9);
      this.activeTileIdx = null;
      this.message = "";
    },
    gameOver(move) {
      return winConditions.some(condition => {
        return condition(this.board, move);
      });
    }
  },
  mounted() {
    this.$root.$on("mark-tile", move => {
      if (this.activeTileIdx != null) {
        this.board.splice(this.activeTileIdx, 1, move);

        if (this.gameOver(move)) {
          this.message = "GG!";
        }
      }
    });
  }
};
</script>

<style scoped>
.game-board {
  width: 500px;
  height: 500px;
  margin: 0 auto;
  background-color: #52aea0;
  color: #fff;
  border: 6px solid #2c3e50;
  border-radius: 10px;
  display: grid;
  grid-template: repeat(3, 1fr) / repeat(3, 1fr);
}

.box {
  border: 6px solid #2c3e50;
  border-radius: 2px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.selected {
  background-color: #cae8e4d9;
}

p {
  margin: 0;
}
</style>
