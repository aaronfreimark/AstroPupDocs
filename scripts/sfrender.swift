// sfrender.swift <symbol.name> <out.png> [pointSize]
// Renders an SF Symbol as a white-on-transparent PNG — the web-side
// stand-in for symbols the apps render natively.
import AppKit

let args = CommandLine.arguments
let name = args[1]
let out = URL(fileURLWithPath: args[2])
let pointSize = CGFloat(Double(args.count > 3 ? args[3] : "64") ?? 64)

let config = NSImage.SymbolConfiguration(pointSize: pointSize, weight: .regular)
guard let base = NSImage(systemSymbolName: name, accessibilityDescription: nil)?
        .withSymbolConfiguration(config)
else { FileHandle.standardError.write("no such symbol: \(name)\n".data(using: .utf8)!); exit(1) }

let size = base.size
let tinted = NSImage(size: size)
tinted.lockFocus()
base.draw(in: NSRect(origin: .zero, size: size))
NSColor.white.set()
NSRect(origin: .zero, size: size).fill(using: .sourceAtop)
tinted.unlockFocus()

guard let tiff = tinted.tiffRepresentation,
      let rep = NSBitmapImageRep(data: tiff),
      let png = rep.representation(using: .png, properties: [:])
else { exit(2) }
try! png.write(to: out)
print("\(name) -> \(out.lastPathComponent) (\(Int(size.width))x\(Int(size.height)))")
