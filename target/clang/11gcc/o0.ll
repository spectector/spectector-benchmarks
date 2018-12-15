; ModuleID = '../sources/clang/11gcc.c'
source_filename = "../sources/clang/11gcc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v11(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = load i32, i32* @array1_size, align 4
  %5 = zext i32 %4 to i64
  %6 = icmp ult i64 %3, %5
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %1
  %8 = load i64, i64* %2, align 8
  %9 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %8
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = mul nsw i32 %11, 512
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* getelementptr inbounds ([131072 x i8], [131072 x i8]* @array2, i32 0, i32 0), i64 %13
  %15 = call i32 @mymemcmp(i8* @temp, i8* %14, i64 1)
  %16 = trunc i32 %15 to i8
  store i8 %16, i8* @temp, align 1
  br label %17

; <label>:17:                                     ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @mymemcmp(i8*, i8*, i64) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %10 = load i8*, i8** %5, align 8
  store i8* %10, i8** %8, align 8
  %11 = load i8*, i8** %6, align 8
  store i8* %11, i8** %9, align 8
  br label %12

; <label>:12:                                     ; preds = %38, %3
  %13 = load i64, i64* %7, align 8
  %14 = add i64 %13, -1
  store i64 %14, i64* %7, align 8
  %15 = icmp ugt i64 %13, 0
  br i1 %15, label %16, label %39

; <label>:16:                                     ; preds = %12
  %17 = load i8*, i8** %8, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %8, align 8
  %19 = load i8, i8* %17, align 1
  %20 = zext i8 %19 to i32
  %21 = load i8*, i8** %9, align 8
  %22 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %22, i8** %9, align 8
  %23 = load i8, i8* %21, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp ne i32 %20, %24
  br i1 %25, label %26, label %38

; <label>:26:                                     ; preds = %16
  %27 = load i8*, i8** %8, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 -1
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i8*, i8** %9, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 -1
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = icmp slt i32 %30, %34
  %36 = zext i1 %35 to i64
  %37 = select i1 %35, i32 -1, i32 1
  store i32 %37, i32* %4, align 4
  br label %40

; <label>:38:                                     ; preds = %16
  br label %12

; <label>:39:                                     ; preds = %12
  store i32 0, i32* %4, align 4
  br label %40

; <label>:40:                                     ; preds = %39, %26
  %41 = load i32, i32* %4, align 4
  ret i32 %41
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
