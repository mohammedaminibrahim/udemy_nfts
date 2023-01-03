const CryptoBirdz = artifacts.require("CryptoBirdz");

module.export = function(deployer) {
    deployer.deploy(CryptoBirdz);
}