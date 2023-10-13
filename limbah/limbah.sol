// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
contract LimbahManagement {
    struct Limbah {
        string name;
        string jenis;
        uint256 berat;
    }

    mapping(uint256 => Limbah) public limbahs;
    uint256 public nextLimbahId;

    event LimbahUpdated(uint256 limbahId, string newName, string newJenis, uint256 newBerat);
    event LimbahDeleted(uint256 limbahId);
    event LimbahAdded(uint256 limbahId, string name, string jenis, uint256 berat);

    function addLimbah(string memory name, string memory jenis, uint256 berat) public {
        limbahs[nextLimbahId] = Limbah(name, jenis, berat);
        emit LimbahAdded(nextLimbahId, name, jenis, berat);
        nextLimbahId++;
    }

    function updateLimbah(uint256 limbahId, string memory newName, string memory newJenis, uint256 newBerat) public {
        require(limbahId < nextLimbahId, "Invalid limbah ID");
        Limbah storage limbah = limbahs[limbahId];
        limbah.name = newName;
        limbah.jenis = newJenis;
        limbah.berat = newBerat;
        emit LimbahUpdated(limbahId, newName, newJenis, newBerat);
    }

    function deleteLimbah(uint256 limbahId) public {
        require(limbahId < nextLimbahId, "Invalid limbah ID");
        delete limbahs[limbahId];
        emit LimbahDeleted(limbahId);
    }
}
