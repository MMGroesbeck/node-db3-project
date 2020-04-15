const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id: id });
}

function findSteps(id) {
  return db
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .from("steps")
    .innerJoin("schemes", "steps.scheme_id", "schemes.id")
    .where({ scheme_id: id })
    .orderBy("steps.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then(([id]) => {
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(([i]) => {
      return findById(i);
    });
}

function remove(id) {
    return findById(id)
        .then(schemes => {
            return db("schemes")
                .where({ id })
                .del()
                .then(count => {
                    return schemes[0];
                })
        })
}
