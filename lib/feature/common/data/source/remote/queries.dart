class Queries {
  Queries._();

  static String get characterList => """
           query characters(\$page: Int) {
              characters(page: \$page) {
                info {
                  next
                }
                results {
                  name
                  id
                  status
                  image
                  species
                }
              }
            }
            """;

  static String get characterDetails => """
           query characters(\$id: ID!) {
              character(id: \$id) {
                name
                id
                status
                type
                image
                species
                origin {
                  name
                  created
                }
                gender
                episode {
                  id
                  name
                  episode
                }
                location {
                  name
                  dimension
                }
              }
            }
            """;
}
