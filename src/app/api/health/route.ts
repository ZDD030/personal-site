export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export function GET() {
  // 目前只验证进程响应；接入数据库后补充数据库可用性检查。
  return Response.json(
    { status: "ok", service: "personal-site" },
    { headers: { "Cache-Control": "no-store" } },
  );
}
