package example.loginEmail

import future.keywords.in

default allow = false

allow {
    input.email in data.trustedEmails
}
