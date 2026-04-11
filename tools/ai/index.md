[Back](../../README.md)

## Artificial Intelligence

### Agents & Tools


- [Claude Code](./claude-code.md)

### System Prompts / "How To Talk To Me"

Customizing how the LLM should communicate with the user

> - If you need more details, ask me questions instead of making assumptions
> - If you do not have information, say that you do not know
> - Provide information in a concise and to-the-point manner.
> - Be extremely concise; Sacrifice grammar for the sake of concision
> - Avoid long text, prefer bullet points
> - Don't be sycophantic
> - Use casual communication style.
> - Skip introductions and summaries unless asked

### Prompts

#### Practices

**Be clear and direct**

**Structure prompts with XML**

Use XML tags to wrap and delineate different parts of your prompt, such as instructions, input data, or examples. This technique helps organize complex prompts with multiple components.

**Use examples: The power of learning by demonstration**

Provide output examples via <examples><example>...</example></examples> tags.

**Chain-of-thought prompting**

Technique where you explicitly instruct LLM to break down complex problems or questions into a series of logical steps, articulate its reasoning at each step, and then use that reasoning to provide a final answer or solution. It's akin to asking a colleague to "think out loud" while solving a problem.

Provide a place to put its thoughts before generating an answer. Consider using XML tags like <thinking> and <answer>.

**Role prompting**

By assigning a role to LLM, you can prime it to respond in a specific way, improve its accuracy and performance, and tailor its tone and demeanor to match the desired context.

#### Examples

> Please quote the phrases mentioned in the sources without paraphrasing.

To reduce the halucinations in the results

## Other

- Rules for coding https://10xrules.ai/
- https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools

[Back](../../README.md)
