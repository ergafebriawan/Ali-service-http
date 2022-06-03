const config = require('../config/database');
const db = require('mysql');
const pool = db.createPool(config);

pool.on('error', (err)=>{
    console.log('error conecting database');
})

module.exports = {
    all_component(req, res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `SELECT * FROM component;`
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Berhasil ambil data!',
                    data: results 
                });
            });
            connection.release();
        })
    },

    component_byid(req, res){
        let id = req.params.id;
        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query('SELECT * FROM component WHERE id_component = ?;', [id],
            function(error, results){
                if(err) throw err;
                res.send({
                    success: true,
                    message: 'berhasil mengambil component by ID',
                    data: results
                });
            });
            connection.release();
        })
    },

    component_byrole(req, res){
        let role = req.params.role;
        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query('SELECT * FROM component WHERE role = ?;', [role],
            function(error, results){
                if(err) throw err;
                res.send({
                    success: true,
                    message: 'berhasil mengambil component by role',
                    data: results
                });
            });
            connection.release();
        })
    }

}