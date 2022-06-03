const router = require('express').Router();
const {monitoring, report, auth} = require('../controller');

//halaman home
router.get('/component', monitoring.all_component);
router.get('/component-byid/:id', monitoring.component_byid);
router.get('/component-byrole/:role', monitoring.component_byrole);

//halaman report service http
router.get('/get_report', report.show_report);
router.post('/add_report', report.add_report);
router.get('/clear_data', report.clear_report);
router.get('/get_total', report.show_spent_power);
router.get('/get_dashboard', report.data_dashboard);
router.get('/get_status', report.get_status_device);

//authentication
router.post('/login', auth.login);
router.get('/token', auth.refreshToken);
router.delete('/logout', auth.logout);

module.exports = router;