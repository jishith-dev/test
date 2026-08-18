; ModuleID = '/data/data/com.termux/files/home/test/build/main.ll'
source_filename = "/data/data/com.termux/files/home/test/build/main.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-android24"

@SEED = external local_unnamed_addr global i32
@.str_main_0 = private unnamed_addr constant [24 x i8] c"Hello Zen from test pkg\00"

declare void @_zen_string_free(ptr) local_unnamed_addr

; Function Attrs: nofree nounwind
define void @_screen_string_main_0(ptr readonly captures(none) %x) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %x)
  %0 = tail call i32 @fflush(ptr null)
  ret void
}

declare ptr @_str_dup(ptr) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noundef i32 @fflush(ptr noundef captures(none)) local_unnamed_addr #0

declare i32 @_time_millis() local_unnamed_addr

define void @_assignSeed() local_unnamed_addr {
entry:
  %t0 = tail call i32 @_time_millis()
  store i32 %t0, ptr @SEED, align 4
  ret void
}

define noundef i32 @main(i32 %argc, ptr readnone captures(none) %argv) local_unnamed_addr {
entry:
  %t0.i = tail call i32 @_time_millis()
  store i32 %t0.i, ptr @SEED, align 4
  %t1 = tail call ptr @_str_dup(ptr nonnull @.str_main_0)
  %puts.i = tail call i32 @puts(ptr nonnull readonly dereferenceable(1) %t1)
  %0 = tail call i32 @fflush(ptr null)
  tail call void @_zen_string_free(ptr nonnull %t1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
