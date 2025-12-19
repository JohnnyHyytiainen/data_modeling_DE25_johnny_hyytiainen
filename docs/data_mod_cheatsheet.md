# Datamodellering - Cheat Sheet

## Cardinality Quick Reference
- 1:1 -> |─────| (exempel: PERSON <--> PASSPORT)
    - One-to-one
- 1:N -> |────< (exempel: CUSTOMER <--> RENTAL)
    - One-to-many
- N:M -> >────< (exempel: ACTOR <--> FILM, needs junction table)
    - Many-to-many

## Entity Identification Checklist
1. Substantiv i business requirement -> potential entities
2. Har det attributes? -> JA = entity, NEJ = attribute
3. Kan det existera självt? -> JA = entity, NEJ = weak entity

## Relationship Identification Checklist
1. Verb mellan entities -> relationship
2. Ask: "Kan X ha flera Y?" → bestämmer cardinality
3. Ask: "Måste X ha Y?" -> bestämmer optionality (kommer vecka 2)

## Real-world examples (från Sakila)
(Se mina SQL lab diagram/charts. 9st)