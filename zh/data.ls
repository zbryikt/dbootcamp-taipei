require! "../data"
base = do
  speakers: data.speakers.map -> it <<< it.zh
module.exports = base
