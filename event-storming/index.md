[Back](../README.md)

>It's developer's (mis)understanding, not expert knowledge that gets released into production
>
>Alberto Brandolini

## Types

### Big Picture

Goals:
- Build model of entire line of business, highlighting collaborations, boundaries, responsibilities and the different perspectives of the involved actors and stakeholders.
- Discover and validate the most compelling problem to solve
- Highlight the significant risks involved with the status quo and possible new solutions

Preparation:
- Invite the right people - diverse backgrounds, caring about the problem
- Prepare the stage - unlimited modelling space, flipchart for legend, postits, markers
  
Introduction:
- Quick informal presentation of participants - background, goals
- Explicitly state the goal - "We are going to explore the business process as a whole by placing all the relevant events along a timeline. We'll highlight ideas, risks and opportunities along the way"
- Inform that the workshop might feel a bit chaotic and awkward at given moments and it is expected
- Inform that the explanation upfront will be short

Chaotic Exploration:


## Notation

| Name            | Representation          | Description                                                                     |
|:----------------|:------------------------|:--------------------------------------------------------------------------------|
| Event           | Orange                  | Relevant to the domain experts, written at past tense                           |
| Hot Spot        | Red, 45 degree rotation | Problems, risks, uncertainties, questions, doubts                               |
| Actor           | Yellow, rectangle       | Person related with the event                                                   |
| External System | Pink                    | External system relevant in the process                                         |
| Gain            | Green, rectangle        | What can be gained in terms of money, user satisfaction etc.                    |
| Loss            | Red, rectangle          | What is potentially lost in terms of money, user satisfactio etc.               |
| Note            | White                   | Other notes, dictionaries etc.                                                  |
| Command         | Blue                    | Instruction issued for the system made by some actor, external system or Policy |
| Read Model      | Green                   | View with data available for an actor to make a decision when issuing commands  |
| Policy          | violet                  | Rules explaining how to react to certain events (or commands?)                  |
| Aggregate       | Yellow                  | Entity that controls the business rules and invariants                          |

## Steps

- Kick-off

  Introduce the Event Storming method. State how the workshop will look like and what is its aim.

- Wild exploration (Divergent)

  Starting from some meaningful domain event, or two events setting some boundaries, write down as many events that happen in the process as possible.
  Add hot spots wherever needed.

- Enforcing the timeline (Emergent)

  Think in what order do the events happen and organize them according to the timeline. Remove duplicates. Discuss the language used.

- Reverse narrative (convergent)

  Go through the timeline and find the missing pieces. Add alternative flows

- Analysis

  Include notes on actors, external systems, gains & losses.
  Note down ideas for future development. Choose parts of the process for more detailed analysis
  
- Design Level

  Delve deeper into the process discovering Commands, Read models, Policies and Aggregates
  
## Good questions & heuristics

- When/Why X changes? Who is changing X?
- Can you repeat/revert change X?
- What are the consequences of X?
- What caused this change to happen?
- What must have happened before X to make X possible?
- Does anything happen between X and Y?
- What if X fails?
- \[0 50 100 150\] Can X happen only partially? Can there be too much of X?
- What else changes when X happens?

https://mrpicky.dev/this-could-be-the-biggest-post-about-big-picture-event-storming-ever-and-with-examples/

## Notes & remarks

### Event types

- Domain

  The most important kind - events that are important from the domain point of view. Indicates some changes inside the system.

- User Interface

  Events that happen on the UI. E.g. user clicked a button. Something appeared on the screen.

- Environment

  Events related to the environment outside of the system. E.g. User entered store.

- Infrastructure

  Events related to the technical infrastructure. E.g. Kafka event sent. Data saved in the database.


## Resources

- [Awesome EventStorming repository by Mariusz Gil](https://github.com/mariuszgil/awesome-eventstorming)
- [Event Storming Cheatsheet](https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet)

[Back](../README.md)
