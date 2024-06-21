package example.GetLoginProofResult

import future.keywords.if

claims := ocm.getLoginProofResult(input.requestId)

isWhitelisted := ocm.getWhitelisting(input.requestId)

resolvedOrgaMeta := http.send({"method": "get", "url": concat("", ["https://api.dev.merlot-education.eu/organisations/organization/", replace(claims.issuerDID, "#", "%23")]), "force_json_decode": true}).body.metadata

# check if we could resolve the metadata
isValidMeta if {
	claims.issuerDID  # could resolve issuerDID
	resolvedOrgaMeta # could resolve meta
}

# check if  active
isActive if {
	resolvedOrgaMeta.active == true
}

# check if either the role is FedAdmin and orga is Federator or if role is not FedAdmin
isValidFederator if {
	# check if role is FedAdmin and organisation is federator
	claims.Role == "FedAdmin"
	resolvedOrgaMeta.membershipClass == "FEDERATOR"
}
isValidFederator if {
	# check if role is not FedAdmin (then orga does not need to be federator
	claims.Role != "FedAdmin"
}

# resolve policy to true only if all 3 conditions match
result if {
	isValidMeta
	isActive
	isValidFederator
	isWhitelisted
}

Vorname = getName(claims)
Nachname = getFamilyName(claims)
Organisation = getOrga(claims)
Role = getRole(claims)
ID = getID(claims)
subjectDID = getSubjectDid(claims)
issuerDID = getissuerDID(claims)
iss = getIss(claims)
sub = getSub(claims)
auth_time = getAuth_time(claims)


getName(c) = x {
	x = c.Vorname
}
getFamilyName(c) = x {
	x = c.Nachname
}
getOrga(c) = x {
	x = c.Organisation
}
getRole(c) = x {
	x = c.Role
}
getID(c) = x {
	x = c.ID
}
getSubjectDid(c) = x {
	x = c.subjectDID
}
getissuerDID(c) = x {
	x = c.issuerDID
}
getIss(c) = x {
	x = c.iss
}
getSub(c) = x {
	x = c.sub
}
getAuth_time(c) = x {
	x = c.auth_time
}
