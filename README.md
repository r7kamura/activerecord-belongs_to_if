# ActiveRecord::BelongsToIf
Allows you to manage preload condition by `:if` condition.

## Usage
```rb
class User < ActiveRecord::Base
  has_many :activities
end

class Activity < ActiveRecord::Base
  belongs_to :comment, if: -> { activity_type == "Comment" }
  belongs_to :issue, if: -> { activity_type == "Issue" }
  belongs_to :pull_request, if: -> { activity_type == "PullRequest" }
end
```

```rb
user.activities.includes(
  [
    :comment,
    {
      issue: :owner,
      pull_request: :owner,
    },
  ]
)
```
