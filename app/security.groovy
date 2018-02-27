#!groovy
 
import jenkins.model.*
import hudson.security.*
import jenkins.security.s2m.AdminWhitelistRule
 
def instance = Jenkins.getInstance()
 
def user = new File("~/config/user.txt").text.trim()
def pass = new File("~/config/pass.txt").text.trim()
 
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(user, pass)
instance.setSecurityRealm(hudsonRealm)
 
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
instance.save()
 
Jenkins.instance.getInjector().getInstance(AdminWhitelistRule.class)