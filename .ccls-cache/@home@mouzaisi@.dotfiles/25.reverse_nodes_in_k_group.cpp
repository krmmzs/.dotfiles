/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution 
{
public:
    ListNode* reverseKGroup(ListNode* head, int k) 
    {
        auto dummy = new ListNode(-1);
        dummy->next = head;
        for(auto p = dummy;;)
        {
            auto q = p;
            for(int i = 0; i < k && q; i ++) q = q->next;
            if(!q) break;
            auto a = p->next, b = a->next;
            for(int i = 0; i < k - 1; i ++)
            {
                auto t = b->next;
                b->next = a;
                a = b, b = t;
            }
            auto t = p->next;
            p->next = a;
            t->next = b;
            p = t;
        }

        return dummy->next;
    }
};

作者：Kurumi
链接：https://www.acwing.com/activity/content/code/content/1820460/
来源：AcWing
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
