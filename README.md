# ActiveRecord::MayBelongTo
Allows you to preload complex polymorphic associations.

## Usage
```rb
class User < ActiveRecord::Base
  has_many :activities
end

class Activity < ActiveRecord::Base
  may_belong_to :comment, if: -> { activity_type == "Comment" }
  may_belong_to :issue, if: -> { activity_type == "Issue" }
  may_belong_to :pull_request, if: -> { activity_type == "PullRequest" }
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
