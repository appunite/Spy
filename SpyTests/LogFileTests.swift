//
//  LogFileTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

class LogFileTests: XCTestCase {
    var fileHandleFactoryMock: PFileHandleFactoryMock!
    var fileManagerMock: PFileManagerMock!
    var fileNameProviderMock: PFileNameProviderMock!
    var url: URL!
    var fileHandleMock: PFileHandleMock!
    var sut: LogFile!
    
    override func setUp() {
        super.setUp()
        fileHandleFactoryMock = PFileHandleFactoryMock()
        fileManagerMock = PFileManagerMock()
        fileNameProviderMock = PFileNameProviderMock()
        fileHandleMock = PFileHandleMock()
        fileHandleFactoryMock.createFileHandleFileURLReturnValue = fileHandleMock
        fileManagerMock.fileExistsAtPathReturnValue = false
        fileManagerMock.createFileAtPathContentsAttributesReturnValue = true
        fileHandleMock.seekToEndOfFileReturnValue = 0
        fileNameProviderMock.fileNameReturnValue = "file"
        fileNameProviderMock.fileExtensionReturnValue = "log"
        url = URL(fileURLWithPath: "123")
        sut = LogFile(type: .monolith, directoryURL: url, fileNameProvider: fileNameProviderMock, fileManager: fileManagerMock, fileHandleFactory: fileHandleFactoryMock)
    }
    
    func testWrite_WhenCalledAndDirectoryDoesntExist_ShouldCreateDirectory() {
        fileManagerMock.fileExistsAtPathReturnValue = false
        sut.write(Data())
        XCTAssertTrue(fileManagerMock.createDirectoryAtWithIntermediateDirectoriesAttributesCalled)
    }
    
    func testWrite_WhenCalledAndDirectoryExists_ShouldNotCreateDirectory() {
        fileManagerMock.fileExistsAtPathReturnValue = true
        sut.write(Data())
        XCTAssertFalse(fileManagerMock.createDirectoryAtWithIntermediateDirectoriesAttributesCalled)
    }
    
    func testWrite_WhenCalledAndFileExists_ShouldUseExistingFile() {
        fileManagerMock.fileExistsAtPathReturnValue = false
        sut.write(Data())
        XCTAssertTrue(fileManagerMock.createFileAtPathContentsAttributesCalled)
    }
    
    func testWrite_WhenCalledAndFileDoesntExist_ShouldCreateFile() {
        fileManagerMock.fileExistsAtPathReturnValue = true
        sut.write(Data())
        XCTAssertFalse(fileManagerMock.createFileAtPathContentsAttributesCalled)
    }
    
    func testWrite_WhenCalled_ShouldSeekToEnd() {
        sut.write(Data())
        XCTAssertTrue(fileHandleMock.seekToEndOfFileCalled)
    }
    
    func testWrite_WhenCalled_ShouldWriteToFile() {
        sut.write(Data())
        XCTAssertTrue(fileHandleMock.writeCalled)
    }
    
    func testWrite_WhenCreatedWithMonolith_ShouldCreateSingleFile() {
        sut.write(Data())
        XCTAssertEqual(1, fileManagerMock.createFileAtPathContentsAttributesCallsCount)
    }
    
    func testWrite_WhenCreatedWithChunked_ShouldCreateMultipleFiles() {
        fileManagerMock = PFileManagerMock()
        fileManagerMock.fileExistsAtPathReturnValue = false
        fileManagerMock.createFileAtPathContentsAttributesReturnValue = true
        sut = LogFile(type: .chunked(maxLogsPerFile: 3), directoryURL: url, fileNameProvider: fileNameProviderMock, fileManager: fileManagerMock, fileHandleFactory: fileHandleFactoryMock)
        for _ in 0..<10 {
            sut.write(Data())
        }
        XCTAssertEqual(4, fileManagerMock.createFileAtPathContentsAttributesCallsCount)
    }
    
    func testDeinit_WhenCalled_ShouldCloseFile() {
        sut = nil
        XCTAssertTrue(fileHandleMock.closeFileCalled)
    }
}
