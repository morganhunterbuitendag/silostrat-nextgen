-- CreateTable
CREATE TABLE `Systems` (
    `SystemID` INTEGER NOT NULL AUTO_INCREMENT,
    `SystemName` VARCHAR(191) NOT NULL,
    `Description` VARCHAR(191) NULL,

    UNIQUE INDEX `Systems_SystemName_key`(`SystemName`),
    PRIMARY KEY (`SystemID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `UserID` INTEGER NOT NULL AUTO_INCREMENT,
    `SystemID` INTEGER NOT NULL,
    `Username` VARCHAR(191) NOT NULL,
    `PasswordHash` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `RoleID` INTEGER NULL,
    `Status` VARCHAR(191) NOT NULL DEFAULT 'Active',
    `CreatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `UpdatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Users_Username_key`(`Username`),
    UNIQUE INDEX `Users_Email_key`(`Email`),
    PRIMARY KEY (`UserID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Roles` (
    `RoleID` INTEGER NOT NULL AUTO_INCREMENT,
    `SystemID` INTEGER NOT NULL,
    `RoleName` VARCHAR(191) NOT NULL,
    `Description` VARCHAR(191) NULL,

    PRIMARY KEY (`RoleID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Permissions` (
    `PermissionID` INTEGER NOT NULL AUTO_INCREMENT,
    `SystemID` INTEGER NOT NULL,
    `PermissionName` VARCHAR(191) NOT NULL,
    `Description` VARCHAR(191) NULL,

    PRIMARY KEY (`PermissionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RolePermissions` (
    `RoleID` INTEGER NOT NULL,
    `PermissionID` INTEGER NOT NULL,
    `SystemID` INTEGER NOT NULL,

    PRIMARY KEY (`RoleID`, `PermissionID`, `SystemID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_SystemID_fkey` FOREIGN KEY (`SystemID`) REFERENCES `Systems`(`SystemID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_RoleID_fkey` FOREIGN KEY (`RoleID`) REFERENCES `Roles`(`RoleID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Roles` ADD CONSTRAINT `Roles_SystemID_fkey` FOREIGN KEY (`SystemID`) REFERENCES `Systems`(`SystemID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Permissions` ADD CONSTRAINT `Permissions_SystemID_fkey` FOREIGN KEY (`SystemID`) REFERENCES `Systems`(`SystemID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RolePermissions` ADD CONSTRAINT `RolePermissions_RoleID_fkey` FOREIGN KEY (`RoleID`) REFERENCES `Roles`(`RoleID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RolePermissions` ADD CONSTRAINT `RolePermissions_PermissionID_fkey` FOREIGN KEY (`PermissionID`) REFERENCES `Permissions`(`PermissionID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RolePermissions` ADD CONSTRAINT `RolePermissions_SystemID_fkey` FOREIGN KEY (`SystemID`) REFERENCES `Systems`(`SystemID`) ON DELETE RESTRICT ON UPDATE CASCADE;
