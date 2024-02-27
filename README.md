# Policies Repository

The Policies Repository contains REGO policies used for evaluation.

### Add Policy

You should follow the following naming syntax:
- Policy must be named exactly `policy.rego`
- Policy is placed in the following directory structure: `{group}/{policyName}/{version}/policy.rego`
    > Example: gaiax/loginpolicy/1.0/policy.rego
- The policy package must follow the following syntax: `{group}.{policyName}`
    > Example: package gaiax.loginpolicy
- Data file could be added for each policy. It must be named `data.json` and placed in the same directory:
    > Example: `{group}/{policyName}/{version}/data.json`

## Dependencies

[Dependencies](go.mod)

## License

[Apache 2.0 license](LICENSE)
