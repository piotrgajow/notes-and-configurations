[Back](../README.md)

> "Failures in complex systems require multiple contributing causes, each necessary but only jointly sufficient."

> "Accidents emerge from a confluence of conditions and occurrences that are usually associated with the pursuit of success, but in this combination—each necessary but only jointly sufficient—able to trigger failure instead."

# Postmortem

## Aim

- Discover what happened
- Not blame!
- Learn from mistakes 
- Find guardrails, tools and resources that can be added to help addressing similar issues in the future

## Action plan

- Establish as clear and precise timeline of events as possible
  - when outage started & when it ended
  - if timeline is not accurate it will be difficult to pinpoint hot spots and suggest effective remediation actions
  - focus on facts that happened and why (context) / how they happened
  - logs, graphs, images, actions (tasks) that were done to solve the issue
- Discussion & going deeper into details and information uncovered
  - explore room for improvement
- Remediation items
  - suggest action points, tasks, improvements

## Things to do

- Have a designated note-taker
- Focus on preparations for the future
  - have better tools
  - have more helpful information
  - have better understanding of the system
- Ask supporting questions
  - why people took those actions
  - what their assumptions where
  - what the intention of that action was
  - what sources of confidence they thought out
  - what tools they had to improvise
  - what data they looked at for confirmation
  - why using one tool over another made more sense at the time

## Things not to do

- Avoid focusing on single fix that will prevent issue from happening in the future
  - allow broader discovery
- Avoid falling into cognitive biases
  - [hindsight bias](https://en.wikipedia.org/wiki/Hindsight_bias) - we could have predicted this earlier
    - more important during remediation phase to generate ideas how to get info earlier
  - [confirmation bias](https://en.wikipedia.org/wiki/Confirmation_bias) - favoring information supporting hypothesis
    - skewing opinion, rushing to conclusions
    - often occurs when there is not enough info
  - [outcome bias](https://en.wikipedia.org/wiki/Outcome_bias) - evaluate decision based on the outcome not context at the time
- Avoid counterfactuals
  - statements that are contrary to the facts of what happened
  - "X should have", "X could have", "X failed to" - talking about things that did not happen
- Do not fall into the trap of "if we did just one thing differently everything would have been fine"

## Areas to look for improvements

- Detecting issue fast enough
- Assessing impact and priority
- Notifying interested parties (customers, users, support)
- Coordinating work
- Data, tools & visibility to help identify and solve the issue
- Metrics, reporting
- Documentation

## Resources

- https://www.infoq.com/articles/postmortems-etsy/
- https://www.kitchensoap.com/2012/02/10/each-necessary-but-only-jointly-sufficient/

[Back](../README.md)
