module CzFaker
  class Data

    # ENERGY
    EAN_LENGTH = 18
    EIC_LENGTH = 16
    GAS_DISTRIBUTORS = [
      { name: "RWE GasNet", code: "RWE", prefixes: %w[ 27ZG2 27ZG3 27ZG4 27ZG5 27ZG6 27ZG7 27ZG8]},
      { name: "E.ON Distribuce", code: "EON", prefixes: %w[ 27ZG9 ] },
      { name: "Pražská Plynárenská", code: "PP", prefixes: %w[ 27ZG1 ]}
    ].freeze
    GAS_TYPES = %w[ N Z V ].freeze
    ELECTRICITY_DISTRIBUTORS = [
      { name: "ČEZ Distribuce", code: "CEZ", prefixes: %w[ 8591824004 8591824005 8591824006 8591824007 8591824008 ] },
      { name: "E.ON Distribuce", code: "EON", prefixes: %w[ 8591824001 8591824002 ] },
      { name: "PREdistribuce", code: "PRE", prefixes: %w[ 8591824003 ] }
    ].freeze
    COMODITIES = %w[ plyn elektřina ].freeze

    # NAME
    NAME_PREFIXES = %w[Bc. Mgr. MgA. Ing. JUDr. MUDr. MDDr. MVDr. RNDr. PharmDr. PhDr. PeaDr. Dr.].freeze
    NAME_SUFFIXES = %w[CSc. Ph.D. Th.D. DSc. DiS. MBA].freeze

    # PERSON
    GENDERS = %w[ muž žena ].freeze
    GENDER_SYMBOLS = %i[ male female ].freeze
    EDUCATIONS = [ "základní", "střední", "střední odborné", "vysokoškolské" ].freeze
    MARITIAL_STATUSES = {
      male: %w[ svobodný ženatý vdovec rozvedený ],
      female: %w[ svobodná vdaná vdova rozvedená ]
    }.freeze

    # BANKS
    CARD_DEFS = {
      master_card: {length: 16, prefixes: %w[51 52 53 54 55] },
      maestro: { length: 16, prefixes: %w[5018 5020 5038 5893 6304 6759 6761 6762 6763]},
      visa: { length: 16, prefixes: %w[4]}
    }.freeze
    CARD_TYPES = %i[ visa maestro master_card ].freeze
    ACCOUNT_NUMBER_WEIGHTS = [ 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ].freeze

    # PHONE NUMBER
    CELL_PREFIXES = ((601..608).to_a + (702..799).to_a).map(&:to_s).freeze
    LAND_LINE_PREFIXES = (200..599).to_a.map(&:to_s).freeze
    FREE_LINE_PREFIXES = ["800"].freeze
    COUNTRY_PREFIX = ["+420", "00420"].freeze

    # COMPANY
    BASE_NAMES = ["Společnost A", "Agenda B", "Firma C", "Spolek D", "Fabrika E"].freeze
    SUFFIXES = ["s.r.o", "a.s.", "k.s.", "o.p.s.", "z.s."].freeze
    ICO_WEIGHTS = [8, 7, 6, 5, 4, 3, 2].freeze
  end
end
