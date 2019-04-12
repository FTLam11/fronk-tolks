let rows = [[], [], []];
let columns = [[], [], []];
let diagonals = [[], []];

for (let i = 0; i < 9; i++) {
  if (Math.floor(i / 3) === 0) {
    rows[0].push(i);
  }
  if (Math.floor(i / 3) === 1) {
    rows[1].push(i);
  }
  if (Math.floor(i / 3) === 2) {
    rows[2].push(i);
  }
  if (i % 3 === 0) {
    columns[0].push(i);
  }
  if (i % 3 === 1) {
    columns[1].push(i);
  }
  if (i % 3 === 2) {
    columns[2].push(i);
  }
  if (i % 4 === 0) {
    diagonals[0].push(i);
  }
  if (i / 4 === 1 || i % 4 === 2) {
    diagonals[1].push(i);
  }
}

const row = (board, move) => {
  return rows.some(row => {
    board.filter((item, idx) => row.includes(idx)).every(tile => tile === move);
  });
};

const column = (board, move) => {
  return columns.some(col => {
    board.filter((item, idx) => col.includes(idx)).every(tile => tile === move);
  });
};

const diagonal = (board, move) => {
  return diagonals.some(diag => {
    board.filter((item, idx) => diag.includes(idx)).every(tile => tile === move);
  });
};

const winConditions = [row, column, diagonal];

export default winConditions
