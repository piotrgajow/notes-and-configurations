[Back](../../README.md)

[Storybook Docs](https://storybook.js.org/docs)

## Stories file

Default export contains the global information about all stories

Each named export is a separate story

### Component level data

- title - Where the component will be in the storybook navigation. `/` is used to denote nested structure
- includeStories/excludeStories - used to control which exports are used as stories for storybook (by default each export is a story)
- component - Component to be shown in the storybook - used for documentation generation
- subcomponents - Used subcomponents that can be linked in the documentation
- tags - used to tag stories (e.g. 'autodocs' to generate documentation)

### Story level data

- name - Story name

### Common data

- parameters - setting of global configuration (background, sizes, layouts etc)
- args - dynamic input data specific for the story
- argTypes - metadata for dynamic data (e.g. defines controls for editing input data)
- render - custom rendering of the component

### Example

```typescript
import type { Meta, StoryObj } from '@storybook/react';

const meta: Meta<$COMPONENT_PROPS$> = {
  title: '$STORY_PATH$',
  component: $COMPONENT$,
  tags: ['autodocs'],
};

export default meta;

type Story = StoryObj<$STORY_ARGS_TYPE$>;

const StoryRender = (args: $STORY_ARGS_TYPE) => {
  // convert story args to component props and render
};

export const $STORY_TITLE$ Story = {
  render: StoryRender,
  args: {
      // args
  },
  parameters: {
    // default parameters
    viewport: {
      defaultViewport: 'tablet',
    },
    layout: 'fullscreen',
  },
};

```

[Back](../../README.md)
