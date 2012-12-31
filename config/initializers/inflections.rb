# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural(/$/, 's')
  inflect.plural(/s$/i, 's')
  inflect.plural(/(us)$/i, '\\1es')
  inflect.plural(/(ax|test)is$/i, '\\1es')
  inflect.plural(/(octop)us$/i, '\\1i')
  inflect.plural(/(alias)$/i, '\\1es')
  inflect.plural(/(bu)s$/i, '\\1ses')
  inflect.plural(/(tomat|potat|ech|her|vet)o$/i, '\\1oes')
  inflect.plural(/([ti])um$/i, '\\1a')
  inflect.plural(/sis$/i, 'ses')
  inflect.plural(/(shea|lea|loa|thie)f$/i, '\\1ves')
  inflect.plural(/(?:([^f])fe|([lr])f)$/i, '\\1\\2ves')
  inflect.plural(/(hive)$/i, '\\1s')
  inflect.plural(/([^aeiouy]|qu)y$/i, '\\1ies')
  inflect.plural(/(x|ch|ss|sh)$/i, '\\1es')
  inflect.plural(/(matr|vert|ind)(?:ix|ex)$/i, '\\1ices')
  inflect.plural(/([m|l])ouse$/i, '\\1ice')
  inflect.plural(/^(ox)$/i, '\\1en')
  inflect.plural(/(quiz)$/i, '\\1zes')

  inflect.singular(/s$/i, '')
  inflect.singular(/(us)es$/i, '\\1')
  inflect.singular(/(corpse)s$/i, '\\1')
  inflect.singular(/(h|bl)ouses$/i, '\\1ouse')
  inflect.singular(/(n)ews$/i, '\\1ews')
  inflect.singular(/([ti])a$/i, '\\1um')
  inflect.singular(/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$/i, '\\1\\2sis')
  inflect.singular(/(^analy)ses$/i, '\\1sis')
  inflect.singular(/(shea|loa|lea|thie)ves$/i, '\\1f')
  inflect.singular(/(li|wi|kni)ves$/i, '\\1fe')
  inflect.singular(/(hive)s$/i, '\\1')
  inflect.singular(/(tive)s$/i, '\\1')
  inflect.singular(/([lr])ves$/i, '\\1f')
  inflect.singular(/([^aeiouy]|qu)ies$/i, '\\1y')
  inflect.singular(/(s)eries$/i, '\\1eries')
  inflect.singular(/(m)ovies$/i, '\\1ovie')
  inflect.singular(/(x|ch|ss|sh)es$/i, '\\1')
  inflect.singular(/([m|l])ice$/i, '\\1ouse')
  inflect.singular(/(bus)es$/i, '\\1')
  inflect.singular(/(o)es$/i, '\\1')
  inflect.singular(/(shoe)s$/i, '\\1')
  inflect.singular(/(cris|ax|test)es$/i, '\\1is')
  inflect.singular(/(octop|vir)i$/i, '\\1us')
  inflect.singular(/(alias)es$/i, '\\1')
  inflect.singular(/^(ox)en/i, '\\1')
  inflect.singular(/(vert|ind)ices$/i, '\\1ex')
  inflect.singular(/(matr)ices$/i, '\\1ix')
  inflect.singular(/(quiz)zes$/i, '\\1')

  inflect.irregular('person', 'people')
  inflect.irregular('tooth', 'teeth')
  inflect.irregular('man', 'men')
  inflect.irregular('child', 'children')
  inflect.irregular('sex', 'sexes')
  inflect.irregular('goose', 'geese')
  inflect.irregular('foot', 'feet')
  inflect.irregular('move', 'moves')

  inflect.uncountable(%w(equipment information money species series jeans police pants status advice))
  #foods
  inflect.uncountable(%w(rice deer fish chicken lamb liver sheep milk moose grass bread advice spaghetti coffee juice oil tea soup water butter cheese flour food fruit rice honey meat parsley toast sugar salt beer wine cream blood powder corn wheat))
end
