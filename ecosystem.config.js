module.exports = {
  apps : [{
    script: 'rails server',
    exec_mode : 'fork_mode',
  }],

  deploy : {
    production : {
    }
  }
};
