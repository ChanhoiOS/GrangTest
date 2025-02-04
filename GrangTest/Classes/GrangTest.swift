import UIKit

open class RootingChecker {
    public static func isJailBreak() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        
        // 탈옥된 장치에서 일반적으로 발견되는 파일이나 디렉토리 확인
        let fileManager = FileManager.default
        let jailbreakFilePaths = [
            "/Applications/Cydia.app",
            "/Applications/Sileo.app",
            "/var/jb/Applications/Sileo.app",
            "/var/jb/Applications/Filza.app",
            "/Applications/Zebra.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/var/jb/usr/sbin/frida-server",
            "/usr/sbin/frida-server",
            "/etc/apt",
            "/usr/bin/ssh",
            "/private/var/lib/apt"
        ]
        
        for path in jailbreakFilePaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        
        // 탈옥된 환경에서만 접근 가능한 cydia 접근 시도
        let cydiaUrlScheme = URL(string: "cydia://package/com.example.package")
        if UIApplication.shared.canOpenURL(cydiaUrlScheme!) {
            return true
        }
        
        // 테스트 파일을 개인 디렉토리에 쓴 다음 즉시 삭제하려고 시도
        let path = "/private/" + UUID().uuidString
        do {
            try "test".write(toFile: path, atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
        
        // 쓰기 전용 디렉토리에서 읽기 모드에서 파일을 열 수 있는지 확인
        var file = fopen("/bin/bash", "r")
        if file != nil {
            fclose(file)
            return true
        }
        
        return false
        #endif
    }
}
