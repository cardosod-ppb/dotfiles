PROJECTS_DIR="$HOME/Projects/work"

# Common
LIBRARIES_DIR="$PROJECTS_DIR/libs"

# Betfair
BETFAIR_DIR="$PROJECTS_DIR/bf"
BETFAIR_COOKBOOKS_DIR="$BETFAIR_DIR/cookbooks"
BETFAIR_COMPONENTS_DIR="$BETFAIR_DIR/components"
BETFAIR_I2_DIR="$BETFAIR_DIR/i2"

# Paddy Power
PP_DIR="$PROJECTS_DIR/pp"
PP_COOKBOOKS_DIR="$PP_DIR/cookbooks"
PP_COMPONENTS_DIR="$PP_DIR/components"
PP_CMS_DIR="$PP_DIR/cms"
PP_I2_DIR="$PP_DIR/i2"
PP_LIBRARIES_DIR="$PP_DIR/libs"
PP_STRANDS="$PP_DIR/strands"


# Common
mkdir -p $LIBRARIES_DIR
cd $LIBRARIES_DIR
echo $PWD
git clone git@gitlab.app.betfair:channels/ansible-playbooks.git
git clone git@github.com:cardosod-ppb/api-collections.git
git clone git@gitlab.app.betfair:spe/externalloadtest_jmeter_scripts.git
git clone git@github.com:Flutter-Global/fabric-workspaces.git 
git clone git@gitlab.app.betfair:nodejs/idl2js.git
git clone git@gitlab.app.betfair:devops/jenkins_job_builder.git
git clone git@github.com:Flutter-Global/org-config.git
git clone git@github.com:Flutter-Global/ppb-channels-sdk.git
git clone git@github.com:Flutter-Global/prismic-tools.git
git clone git@github.com:Flutter-Global/uki-channels-http-clients.git


# Betfair
mkdir -p $BETFAIR_DIR
cd $BETFAIR_DIR
git clone git@github.com:Flutter-Global/tbd.git
git clone git@github.com:Flutter-Global/tbd-bff.git
git clone git@github.com:Flutter-Global/tbd-prismic-custom-type.git

mkdir -p $BETFAIR_COOKBOOKS_DIR
cd $BETFAIR_COOKBOOKS_DIR
git clone git@github.com:Flutter-Global/tbd-native-chef.git
git clone git@github.com:Flutter-Global/tbd-web-chef.git
git clone git@github.com:Flutter-Global/tbdsbg-native-chef.git
git clone git@github.com:Flutter-Global/tbdsbg-web-chef.git

mkdir -p $BETFAIR_COMPONENTS_DIR
cd $BETFAIR_COMPONENTS_DIR
git clone git@github.com:Flutter-Global/the-wall.git
git clone git@github.com:Flutter-Global/the-wall-design-tokens.git
git clone git@github.com:Flutter-Global/the-wall-fetch-figma-assets.git

mkdir -p $BETFAIR_I2_DIR
cd $BETFAIR_I2_DIR
git clone git@github.com:Flutter-Global/tbdn-configrepo-i2-ppb.git
git clone git@github.com:Flutter-Global/tbdn-configrepo-i2-sbg.git
git clone git@github.com:Flutter-Global/tbd-configrepo-i2-sbg.git
git clone git@github.com:Flutter-Global/tbd-configrepo-i2-ppb.git


# Paddy Power
mkdir -p $PP_DIR
cd $PP_DIR
git clone git@github.com:Flutter-Global/ppsb-web.git

mkdir -p $PP_COOKBOOKS_DIR
cd $PP_COOKBOOKS_DIR
git clone git@gitlab.app.betfair:chef-cookbooks/fcn-gin-ice.git
git clone git@gitlab.app.betfair:chef-cookbooks/fcn-spa-gin.git
git clone git@gitlab.app.betfair:chef-cookbooks/fcn-gin-rum.git
git clone git@gitlab.app.betfair:chef-cookbooks/ppsms-static-client.git
git clone git@gitlab.app.betfair:chef-cookbooks/smsiospp.git

mkdir -p $PP_COMPONENTS_DIR
cd $PP_COMPONENTS_DIR
git clone git@github.com:Flutter-Global/abacus-design-tokens.git
git clone git@github.com:Flutter-Global/action-fetch-figma-assets.git
git clone git@gitlab.app.betfair:exchange-components/betslip.git
git clone git@gitlab.app.betfair:pp-sportsbook-web/bet-tracker.git
git clone git@github.com:Flutter-Global/design-tokens.git
git clone git@github.com:Flutter-Global/ppsb-abacus.git

mkdir -p $PP_CMS_DIR
cd $PP_CMS_DIR
git clone git@gitlab.app.betfair:gin/rum-keg.git
git clone git@gitlab.app.betfair:gin/fcn-spa-gin.git
git clone git@gitlab.app.betfair:gin/fcn-gin-rum.git

mkdir -p $PP_I2_DIR
cd $PP_I2_DIR
git clone git@gitlab.app.betfair:i2/shared-configs/pp_channels.git
git clone git@gitlab.app.betfair:i2/ppwfe.git
git clone git@gitlab.app.betfair:i2/rum.git
git clone git@gitlab.app.betfair:i2/smsiospp.git
git clone git@gitlab.app.betfair:i2/smspp.git

mkdir -p $PP_LIBRARIES_DIR
cd $PP_LIBRARIES_DIR
git clone git@gitlab.app.betfair:pp-sportsbook-web/docker-ppbf-reverse-proxy.git
git clone git@gitlab.app.betfair:pp-sportsbook-web/flexible-environment-generator.git
git clone git@gitlab.app.betfair:pp-sportsbook-web/ppbf-sb-platform.git
git clone git@github.com:Flutter-Global/ppsb-platform.git
git clone git@github.com:Flutter-Global/ppsb-prismic-models.git
git clone git@gitlab.app.betfair:pp-sportsbook-web/ppweb-primary-markets.git

mkdir -p $PP_STRANDS
cd $PP_STRANDS
git clone git@gitlab.app.betfair:pp-sportsbook-web/docker-strands.git
git clone git@github.com:Flutter-Global/ppsb-graphql-pub.git