[Back](./index.md)

## Merging strategies

### Description

 link to repo

how to backmerge (hotfix -> main -> dev VS hotfix -> main & hotfix -> dev)
how to merge (merge commit, squash merge, only fast forward)
how to resolve conflicts (merge commits, rebases)

### Setup & flow

1. `main`, `dev` started as baseline
2. `feature-a`, `feature-b` started from `dev`
3. `feature-a` finished and merged to `dev`
4. release from `dev` to `main`
5. `feature-b` finished and merged to `dev`
6. `feature-c` started from `dev`
7. `hotfix` started from `main` and merged to `main` & backmerged to `dev`
8. `feature-c` finished and merged to `dev`
9. release from `dev` to `main`

### Variants

#### 1.

features - merge commit
releases - merge commit
hotfixes - merge commit
backmerges - merge commit (main -> dev)

Issue: Conflict during backmerging possible, cannot fix without releasing

#### 2.

features - merge commit
releases - merge commit
hotfixes - merge commit
backmerges - merge commit (hotfix -> dev)

[Back](./index.md)


foo
bar
baz

=====

iiiiLorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis condimentum ante ultrices finibus. Donec ac lectus facilisis, finibus sem in, mollis nunc. Donec id consectetur arcu. Donec eu urna eget eros vehicula tincidunt. Quisque tempus erat efficitur semper rutrum. Praesent bibendum enim sed metus placerat tincidunt. Sed condimentum urna eu justo mattis placerat. Fusce in risus vel arcu accumsan accumsan sed ut lectus. Nunc iaculis eros condimentum erat gravida, id suscipit diam ultricies. Nullam eget turpis ut nulla dignissim pulvinar. Phasellus dignissim mauris sit amet ullamcorper consectetur. Praesent id urna lacus. Nunc at vulputate neque, vel finibus neque. In condimentum condimentum nibh in mattis. Nam rhoncus suscipit diam, eu gravida orci. Nam lacinia diam a augue iaculis, pulvinar accumsan est efficitur.
bar
baz

=====

foo
Maecenas ut vestibulum risus. Ut in mattis purus, vehicula sodales risus. Sed massa nisi, volutpat eget ex pretium, iaculis porta nulla. Vestibulum tempor mi et magna tempor pulvinar. Donec lobortis condimentum magna sit amet dictum. Donec lacinia ornare sem non imperdiet. Sed fermentum feugiat orci, ac commodo tortor dapibus id. Proin molestie fermentum orci eget fermentum. Ut at arcu eget urna tristique varius. Proin pulvinar ultrices lacus. Aliquam erat volutpat. Aliquam bibendum est id lorem condimentum venenatis. Praesent sit amet ultricies est.
baz





