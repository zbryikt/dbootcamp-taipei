dbootcamp-taipei
----------------

Dev Guide
================

```
npm install
lsc server
```

open site in http://localhost:9999/


Build Rule
=================

 * <path>/<name>.ls -> <path>/<name>.js     # except when <name> = data
 * <path>/<name>.jade -> <path>/<name>.html # no recursive build (TODO)
   * all jade will be built with variables exported in <path>/data.ls
 * <path>/<name>.styl -> <path>/<name>.css  # recursively


I18n
=================

 1. use extends in <locale>/ folder.
 2. use data.ls for centralized material
 3. write data.ls just like a nodejs module

