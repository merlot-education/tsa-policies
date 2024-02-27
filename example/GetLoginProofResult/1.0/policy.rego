package example.GetLoginProofResult

claims := ocm.getLoginProofResult(input.requestId)

orgaUrl := concat("", ["https://api.dev.merlot-education.eu/organisations/organization/", replace(claims.iss, "#", "%23")])
resolvedOrgaMeta = http.send({"method": "get", "url": orgaUrl, "force_json_decode": true}).body.metadata

orgaIsActive := true

name = val {
	orgaIsActive == true
	val := getName(claims)
}

given_name = getGivenName(claims)
family_name = getFamilyName(claims)
middle_name = getMiddleName(claims)
preferred_username = getPreferredUsername(claims)
gender = getGender(claims)
birthdate = getBirthdate(claims)
email = getEmail(claims)
email_verified = getEmailVerified(claims)
sub = getSub(claims)
iss = getIss(claims)
auth_time = getAuthTime(claims)

getName(c) = x {
	x = c.prcFirstName
}
getGivenName(c) = x {
	x = c.prcFirstName
}
getFamilyName(c) = x {
	x = c.prcLastName
}
getMiddleName(c) = x {
	x = c.prcMiddleName
}
getPreferredUsername(c) = x {
	x = c.prcPreferredUsername
}
getGender(c) = x {
	x = c.prcGender
}
getBirthdate(c) = x {
	x = c.prcBirthdate
}
getEmail(c) = x {
	x = c.email
}
getEmailVerified(c) = x {
	x = c.email_verified
}
getSub(c) = x {
	x = c.subjectDID
}
getIss(c) = x {
	x = c.issuerDID
}
getAuthTime(c) = x {
	x = c.auth_time
}
