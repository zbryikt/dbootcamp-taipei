require! "../data"
base = data.locale "zh"

/*
base = do
  speakers: data.speakers.map -> it <<< it.zh
  features: data.features.map -> it <<< it.zh
  navbar: data.navbar.map -> it <<< {name: it.zh}
  aux: {}
for k,v of data.aux => base.aux[k] = v.zh
*/

module.exports = base
