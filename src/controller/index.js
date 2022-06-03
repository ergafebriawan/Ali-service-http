const monitoring = require('./controller-monitoring')
const report = require('./controller-reportHttp')
const auth = require('./controller-auth')

module.exports = {
    monitoring,
    report,
    auth
}
