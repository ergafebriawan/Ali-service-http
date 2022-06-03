const config = require('../config/database');
const db = require('mysql');
const pool = db.createPool(config);

pool.on('error', (err)=>{
    console.log('ERROR: tidak bisa koneksi ke database...')
});

module.exports = {
    data_dashboard(req, res){
        const query = 'SELECT * FROM http_report ORDER BY id DESC LIMIT 1';

        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query(query, function(error, results){
                if(error){
                    return res.json({
                        success: false,
                        message: 'gagal menampilkan data..',
                        data: results
                    });
                }else{
                    return res.json({
                       success: true,
                       message: 'mnampilkan semua data dashboard..',
                       data: results
                    });
                }
            });
            connection.release();
        });
    },
    show_report(req, res){
        const query = 'SELECT * FROM http_report;';

        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query(query, function(error, results){
                if(error){
                    return res.json({
                        success: false,
                        message: 'gagal menampilkan data..',
                        data: results
                    });
                }else{
                    return res.json({
                       success: true,
                       message: 'mnampilkan semua data report..',
                       data: results
                    });
                }
            });
            connection.release();
        });
    },
    show_spent_power(req, res){
        const query = 'SELECT SUM(decrement_volt) AS total_pengurangan, AVG(decrement_volt) AS avg_pengurangan FROM http_report';
        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query(query, function(error, results){
                if(error){
                    return res.json({
                        success: false,
                        message: 'gagal menampilkan data..',
                        data: results
                    });
                }else{
                    return res.json({
                       success: true,
                       message: 'mnampilkan semua data',
                       data: results
                    });
                }
            });
            connection.release();
        });
    },
    add_report(req, res){
        let data = {
            ketinggian : req.body.ketinggian,
            pintu : req.body.pintu,
            tegangan: req.body.tegangan,
            decrement_volt: req.body.decrement_volt,
            gps : req.body.gps,
            status: req.body.status
        }
        const query = 'INSERT INTO http_report (ketinggian, pintu, tegangan, decrement_volt, gps, status) VALUES (?,?,?,?,?,?);';

        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query(
                query, [data.ketinggian, data.pintu, data.tegangan, data.decrement_volt, data.gps, data.status],
                function(error, results){
                    if(error){
                        return res.send({
                            success : false,
                            message: 'gagal menambahkan data..',
                            data: ''
                        });
                    }else{
                        return res.send({
                            success: true,
                            message: 'berhasil menambahkan data...',
                            data: data
                        });
                    }
            });
            connection.release();
        });
    },
    clear_report(req, res){
        const query = 'TRUNCATE TABLE http_report;';
        
        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query( query, function(error, results){
                if(error){
                    return res.send({
                        success: false,
                        message: 'gagal menghapus semua data...'
                    });
                }else{
                    res.send({
                        success: true,
                        message: 'berhasil menghapus semua data...'
                    });
                }
            });
            connection.release();
        })
    },
    get_status_device(req, res){
        const query = 'SELECT status FROM http_report ORDER BY id DESC LIMIT 1';
        pool.getConnection(function(err, connection){
            if(err) throw err;
            connection.query( query, function(error, results){
                if(error){
                    return res.send({
                        success: false,
                        message: 'gagal mengambil data...'
                    });
                }else{
                    res.send({
                        success: true,
                        message: 'berhasil mengambil data...',
                        data: results
                    });
                }
            });
            connection.release();
        })
    },


}