## hello mock docs

!!! test
Testing something

Abbreviations:
Some text about MOCDOC

This is a paragraph.
{: #test_id .test_class }

Apple
: Pomaceous fruit of plants of the genus Malus in
the family Rosaceae.

```javascript
import { test } from 'something';

const addThingToThing = (a, b) a + b;
```

- [abc](#abc)
- [xyz](#xyz)

## abc

This is a b c.

## xyz

This is x y z.

# The attack plan

{% dot attack_plan.svg
    digraph G {
        rankdir=LR
        Earth [peripheries=2]
        Mars
        Earth -> Mars
    }
%}

```graphviz dot attack_plan.svg
digraph G {
    rankdir=LR
    Earth [peripheries=2]
    Mars
    Earth -> Mars
}
```

# PlantUML Samples

```plantuml classes="uml myDiagram" alt="Diagram placeholder" title="My diagram"
@startuml
  Goofy ->  MickeyMouse: calls
  Goofy <-- MickeyMouse: responds
@enduml
```

# Mermaid Samples

```kroki-mermaid
sequenceDiagram
GitLab->>Kroki: Request rendering
Kroki->>Mermaid: Request rendering
Mermaid-->>Kroki: Image
Kroki-->>GitLab: Image
```

# Emojis

:bulb: :smile:

# Code blocks

```javascript
import { test } from 'something';

const addThingToThing = (a, b) a + b;
```

# Grouped Code blocks

=== "JavaScript"

    ```javascript
    import { test } from 'something';

    const addThingToThing = (a, b) a + b;
    ```

=== "Java"

    ```java
    public void function() {
        test();
    }
    ```

```java tab="java"
    public void function() {
      test();
    }
```

```java tab="java 2"
    public void function() {
      test();
    }
```

# MDX truly sane lists

- attributes

- customer
  - first_name
    - test
  - family_name
  - email
- person
  - first_name
  - family_name
  - birth_date
- subscription_id

- request

<!-- prettier-ignore -->
*[MOCDOC]: Mock Documentation
