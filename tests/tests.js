/*
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
*/

/* jshint jasmine: true */

exports.defineAutoTests = function() {
  describe('FileHash Information (window.FileHash)', function () {
    it("should exist", function() {
      expect(window.FileHash).toBeDefined();
    });

    it("should contain a function named md2", function() {
      expect(window.FileHash.md2).toBeDefined();
    });

    it("should contain a function named md5", function() {
      expect(window.FileHash.md5).toBeDefined();
    });

    it("should contain a function named sha1", function() {
      expect(window.FileHash.sha1).toBeDefined();
    });

   it("should contain a function named sha256", function() {
      expect(window.FileHash.sha256).toBeDefined();
    });

   it("should contain a function named sha384", function() {
      expect(window.FileHash.sha384).toBeDefined();
    });

    it("should contain a function named sha512", function() {
      expect(window.FileHash.sha512).toBeDefined();
    });

  });
};

exports.defineManualTests = function(contentEl, createActionButton) {
    var logMessage = function (message, color) {
        var log = document.getElementById('info');
        var logLine = document.createElement('div');
        if (color) {
            logLine.style.color = color;
        }
        logLine.innerHTML = message;
        log.appendChild(logLine);
    };

    var clearLog = function () {
        var log = document.getElementById('info');
        log.innerHTML = '';
    };
	
	var fileUrl = './index.html';
	var fColor = "#99FF99";

    var hash_tests = '<h3>Press FileHash button to get crypto hash of index.html</h3>' +
        '<div id="dump_data"></div>' +
        'Expected result: Status box will get updated with {file: "<file path>", algo: "<ALGO>", result: "<result>"}';

    contentEl.innerHTML = '<div id="info"></div>' + hash_tests;

    createActionButton('Get Hashs', function() {
      clearLog();
	  
	  window.FileHash.md2(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
	  window.FileHash.md5(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
	  window.FileHash.sha1(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
	  window.FileHash.sha256(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
	  window.FileHash.sha384(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
	  window.FileHash.sha512(fileUrl,function(ret){logMessage(JSON.stringify(ret), fColor);});
    }, "dump_data");
};