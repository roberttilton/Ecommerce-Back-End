const router = require('express').Router();
const { Tag, Product, ProductTag } = require('../../models');

// The `/api/tags` endpoint

router.get('/', (req, res) => {
  // find all tags
  // be sure to include its associated Product data
  Tag.findAll({ include: [Product],}).then((tags) => res.json(tags));
});

router.get('/:id', (req, res) => {
  const tagId = req.params.id;
  // find a single tag by its `id`
  // be sure to include its associated Product data
  Tag.findOne({ where: { id: tagId }, include: [Product],}).then((tags) => res.json(tags));
});

router.post('/', (req, res) => {
  // create a new tag
  Tag.create(req.body).then((tags) => res.status(200).res.json(tags));
});

router.put('/:id', (req, res) => {
  // update a tag's name by its `id` value
  Tag.update(req.params.id).then((tags) => res.status(200).res.json(tags));
});

router.delete('/:id', (req, res) => {
  // delete on tag by its `id` value
  Tag.destroy(req.params.id).then((tags) => res.status(200).res.json(tags));
});

module.exports = router;
