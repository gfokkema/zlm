const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("zlm", .{
        .root_source_file = b.path("src/zlm.zig"),
    });

    const test_exe = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/test.zig"),
            .target = b.standardTargetOptions(.{}),
        }),
    });

    const test_run = b.addRunArtifact(test_exe);

    b.getInstallStep().dependOn(&test_run.step);
}
